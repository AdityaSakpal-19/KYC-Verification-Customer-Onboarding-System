import pandas as pd
import random
import string

def generate_pan():
    letters = ''.join(random.choices(string.ascii_uppercase, k=5))
    digits = ''.join(random.choices(string.digits, k=4))
    last = random.choice(string.ascii_uppercase)
    return letters + digits + last

def generate_aadhaar(valid=True):
    if valid:
        return ''.join(random.choices(string.digits, k=12))
    else:
        return ''.join(random.choices(string.digits, k=random.choice([5,8,10])))

data = []

for i in range(1000):
    pan = generate_pan() if random.random() > 0.2 else None
    aadhaar = generate_aadhaar(valid=random.random() > 0.2) if random.random() > 0.2 else None
    linked = random.choice(['Yes', 'No'])

    data.append([i+1, f'User_{i+1}', pan, aadhaar, linked])

df = pd.DataFrame(data, columns=[
    'customer_id', 'name', 'pan', 'aadhaar', 'pan_aadhaar_linked'
])

df.to_csv('kyc_data.csv', index=False)