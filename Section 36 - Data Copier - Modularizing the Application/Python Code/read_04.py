import os
import pandas as pd


def get_json_reader(BASE_DIR, table_name, chunksize=100):
    fiel_name = os.listdir(f"{BASE_DIR}/{table_name}")[0]
    fp = f'{BASE_DIR}/{table_name}/{file_name}'
    return pd.read_json(fp, lines=True, chunksize=chunksize)


if __name__ == "__main__":
    BASE_DIR = os.environ.get("BASE_DIR")
    table_name = os.environ.get("TABLE_NAME")
    json_reader = get_json_reader(BASE_DIR, table_name)

    for idx, df in enumerate(json_reader):
        print(f'Number of records in chunk with {idx} is {df.shape[0]}')
