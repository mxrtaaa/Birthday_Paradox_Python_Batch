import random
import os
import time

def generate_random_birthdays(n):
    birthdays = []
    for i in range(n):
        date = random.randint(1,365)
        birthdays.append(date)
    return birthdays

def same_birthday_chances(n, t = 20000):
    are_same = 0
    tests = t
    for i in range(tests):
        birthdays = generate_random_birthdays(n)
        for birthday in birthdays:
            if birthdays.count(birthday) > 1:
                are_same += 1
                break
    return are_same/tests

def validate_tests_number(input_file):
    try:
        with open(input_file, 'r') as f_in:
            tests = f_in.readline()
            tests = int(tests)
            if tests < 1:
                raise ValueError
    except (IOError, ValueError):
        print("Niepoprawne dane wejściowe. Przyjmuję domyślną liczbę testów 20000.")
        tests = 20000
    return tests

def solve_birthday_problem(input_file, output_file):
    tests = validate_tests_number(input_file)

    try:
        with open(output_file, 'w') as f_out:
            start_time = time.time()
            n = 2
            chances = same_birthday_chances(n, tests)

            while chances < 0.5:
                n += 1
                chances = same_birthday_chances(n, tests)

            end_time = time.time()
            runtime = end_time - start_time

            f_out.write(f"Najmniejsza liczba osób, które spełniają warunek: {n}\n")
            f_out.write(f"z przybliżonymi szansami: {(chances*100):.2f}%\n")
            f_out.write(f"Liczba wykonanych testów dla danej liczby osób: {tests}\n")
            f_out.write(f"Czas trwania obliczeń: {runtime:.4f} s")
            return True
    except FileNotFoundError:
        print(f"Nastąpił błąd przy otwarciu pliku {output_file}")
        return False


if __name__ == '__main__':
    input_folder = "input"
    input_file = os.path.join(input_folder, "in.txt")
    output_folder = "output"
    os.makedirs(output_folder, exist_ok=True)
    output_file = os.path.join(output_folder, "out.txt")

    print(f"Przetwarzanie pliku: {input_file}")
    if solve_birthday_problem(input_file, output_file):
        print(f"Wynik zapisany w pliku: {output_file}")
    else:
        print(f"Błąd przetwarzania pliku: {output_file}")

