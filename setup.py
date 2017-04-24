from setuptools import setup
setup(
    name="radioserver",
    packages=["radioserver"],
    include_package_data=True,
    install_requires=[
        "flask",
        "sqlalchemy",
        "psycopg2",
    ],

)
