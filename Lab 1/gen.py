
for i in range(105, 110):
    print(f"INSERT INTO Student(Bno, Title, Author, Price) VALUES('BNO{i}', 'TITL{i}', 'C{i}',{int(i/3)*7});");
