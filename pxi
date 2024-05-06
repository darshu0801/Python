import nidcpower
import numpy as np
import openpyxl
import threading
import time
from collections import deque
import matplotlib.pyplot as plt
import pandas as pd

start = time.time()
queue = deque(maxlen=1800000)
count1 = []
count2 = 0
min_values = []
max_values = []
mean_values = []
data = []
lock = threading.Lock()

def meas():
    global mean_value, max_value, min_value
    lock.acquire()
    try:
        mean_value = np.mean(queue)
        max_value = np.max(queue)
        min_value = np.min(queue)
        min_values.append(min_value)
        max_values.append(max_value)
        mean_values.append(mean_value)
        thread2 = threading.Thread(target=log)
        thread2.start()
        update_plot()
    finally:
        lock.release()

def log():
    global count3
    lock.acquire()
    try:
        count3+=1
        data = []
        for values in queue:
            data.append(values)
        df = pd.DataFrame(data[900000:])
        df.to_excel('e{}.xlsx'.format(count3),index=False)
    finally:
        lock.release()

def update_plot():
    global count2
    lock.acquire()
    try:
        count1.append(count2)
        count2 += 1
        plt.plot(count1, min_values, label='Min Value',color='red')
        plt.plot(count1, max_values, label='Max Value',color='green')
        plt.plot(count1, mean_values, label='Mean Value',color='blue')
        plt.xlabel('Seconds')
        plt.ylabel('Current')
        plt.legend()
        plt.pause(0.01)  # Pause to allow the plot to update
    finally:
        lock.release()

def example():
    global measurements
    while True:
        with nidcpower.Session(resource_name='Dev1', options=options) as session:
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
                    lock.acquire()
                    try:
                        queue.append(value)
                    finally:
                        lock.release()
                if len(queue) >= 1800000:
                    meas()

if __name__ == '__main__':
    global options
    options = {'simulate': False, 'driver_setup': {'Model': '4145', 'BoardType': 'PXIe', }, }
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.append(['Min', 'Max', 'Average'])
    thread5 = threading.Thread(target=example)
    thread5.start()
    end = time.time()
    print(end - start)
    plt.ion()
    plt.show()  # Show the plot after all iterations