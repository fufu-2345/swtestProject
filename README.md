# For installing

pip install -r requirements.txt

# Run script

robot -d results/"ชื่อ folder ที่อยากเอา output ไปเก็บ" "ตำแหน่งของ file robot (ใส่เป็น path ได้)"  
เช่น robot -d results/performance performance_tests/tests/\*

# Activate

Window: venv\Scripts\activate.bat  
Linux: source venv/bin/activate

# Deactivate

deactivate

# freeze

pip freeze > requirements.txt
