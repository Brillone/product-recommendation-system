import os
import json
import re
import pandas as pd
import numpy as np
from dask import dataframe as dd
from dask.distributed import Client, LocalCluster 
import time


def init_cluster():
    cluster = LocalCluster(n_workers=2, threads_per_worker=1, processes=False)
    return Client(cluster)


def read_data(read_path, partition_size):
    df = dd.read_csv(read_path)

    npartitions = np.ceil(df.shape[0].compute()/partition_size).astype('int')
    
    # repartition
    return df.repartition(npartitions=npartitions)


def save_to_dir(dataframe, path):
    dataframe.to_parquet(path, write_metadata_file=False)


def main(read_path, save_path, partition_size):
    client = init_cluster()

    # read data
    df = read_data(read_path, partition_size)

    # save data local
    save_to_dir(df, save_path)

    client.shutdown()


if __name__ == "__main__":
    read_path = 'product-recommendation-system-dataset/downloaded-data/*.csv'

    save_path = 'product-recommendation-system-dataset/raw-data'

    partition_size = 10**6

    main(read_path, save_path, partition_size)