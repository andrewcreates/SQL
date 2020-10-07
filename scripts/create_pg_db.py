import psycopg2


def create_connection(db_name, db_user, db_password, db_host, db_port):
    connection = None
    try:
        connection = psycopg2.connect(
            database=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port
        )
        print('Connection to PostgreSQL DB, {}, successful'.format(db_name))
    except psycopg2.OperationalError as e:
        print(f"The error '{e}' occurred")
    return connection


connection = create_connection('practice_db', 'postgres', 'jastusP9!@code', 'localhost', '5432')


def create_database(connection, query):
    connection.autocommit = True
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print('Query successfully executed')
    except psycopg2.OperationalError as e:
        print(f"The error '{e}' occurred")


create_database_query = "CREATE DATABASE py_connect"
create_database(connection, create_database_query)
