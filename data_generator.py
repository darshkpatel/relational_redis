from faker import Faker
import csv

fake = Faker()


def gen_random_dict(num):
    for i in range(num):
        yield {
            "name": fake.name(),
            "country": fake.country(),
            "phone": fake.phone_number(),
            "zip": fake.postcode(),
            "ipaddress": fake.ipv4_public(network=False, address_class=None)
        }


with open("test_data.csv", "w") as f:
    fieldnames = ['name', 'country', 'phone', 'zip', 'ipaddress']
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    for row in gen_random_dict(100000):
        writer.writerow(row)

