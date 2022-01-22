import os
import click
from read import get_json_reader
from write import load_db_table


def process_table(BASE_DIR, conn, table_name):
    json_reader = get_json_reader(BASE_DIR, table_name)
    for df in json_reader:
        load_db_table(df, conn, table_name, df.columns[0])


@click.command()
@click.option('--tables', help='Provide comma separated table list')
def main(tables):
    BASE_DIR = os.environ.get('BASE_DIR')
    if tables:
        table_list = tables.split(',')

    configs = dict(os.environ.items())
    conn = f'postgresql://{configs["DB_USER"]}:{configs["DB_PASS"]}@{configs["DB_HOST"]}:{configs["DB_PORT"]}/{configs["DB_NAME"]}'
    for table_name in table_list:
        process_table(BASE_DIR, conn, table_name)


if __name__ == '__main__':
    main()
