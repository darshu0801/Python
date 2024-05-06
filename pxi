#!/usr/bin/python

import nidcpower
import numpy as np
import openpyxl
import threading
import time
from collections import deque
import matplotlib.pyplot as plt
import pandas as pd
import multiprocessing

start = time.time()
count1 = []
count2 = 0
min_values = []
max_values = []
mean_values = []
data = []
count3 = 90

def meas(queue):
    global mean_values, max_values, min_values, count3
    for _ in range(11):
        if len(queue) == 1800000:
            mean_value = np.mean(queue)
            max_value = np.max(queue)
            min_value = np.min(queue)
            min_values.append(min_value)
            max_values.append(max_value)
            mean_values.append(mean_value)
            log(queue)
            update_plot()

def log(queue):
    global count3
    count3 += 1
    data = list(queue)[900000:]
    df = pd.DataFrame(data)
    df.to_excel('e{}.xlsx'.format(count3), index=False)

def update_plot():
    global count2
    count1.append(count2)
    count2 += 1
    plt.plot(count1, min_values, label='Min Value', color='red')
    plt.plot(count1, max_values, label='Max Value', color='green')
    plt.plot(count1, mean_values, label='Mean Value', color='blue')
    plt.xlabel('Seconds')
    plt.ylabel('Current')
    plt.legend()
    plt.pause(0.01)  # Pause to allow the plot to update

def example(queue):
    for i in range(11):
        with nidcpower.Session(resource_name='Dev1', options={'simulate': False, 'driver_setup': {'Model': '4145', 'BoardType': 'PXIe'}}) as session:
            session.measure_record_length = 1800000
            session.aperture_time = 0.00000055556
            session.source_mode = nidcpower.SourceMode.SINGLE_POINT
            session.output_function = nidcpower.OutputFunction.DC_CURRENT
            session.current_level = 0
            session.voltage_limit_range = 20
            session.current_level_range = 0.00000001
            session.voltage_limit = 20
            session.measure_when = nidcpower.MeasureWhen.AUTOMATICALLY_AFTER_SOURCE_COMPLETE
            with session.initiate():
                measurements = session.channels['Dev1/0'].fetch_multiple(count=200000)
                for value in [x[0] for x in measurements]:
                    queue.append(value)

if __name__ == '__main__':
    # Create a multiprocessing manager to share data between processes
    manager = multiprocessing.Manager()
    queue = manager.list()

    # Create processes
    p1 = multiprocessing.Process(target=example, args=(queue,))
    p2 = multiprocessing.Process(target=meas, args=(queue,))

    # Start processes
    p1.start()
    p2.start()

    # Join processes
    p1.join()
    p2.join()

    end = time.time()
    print(end - start)

    plt.ion()
    plt.show()  # Show the plot after all iterations