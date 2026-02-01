### Zadanie
Program realizuje rozwiązanie zadania konkursu Algorytmion (rok 2013, zad. 3) - ,,Paradoks urodzin". Zadanie rozwiązywane jest w pliku paradoks-urodzin.py.  
Program obsługiwany jest przy użyciu skryptu menu.bat, który przy pomocy pliku raport.py generuje raport rozwiązania w formie .html.

### Opis programu
W klasycznym ujęciu, rozwiązanie problemu urodzin polega na znalezieniu najmniejszej liczby osób takiej, żeby prawdopodobieństwo znalezienia dwóch osób obchodzących urodziny tego samego dnia było równe co najmniej 50%. Paradoks polega na tym, że ta liczba jest zaskakująco mała – potrzeba jedynie 23 osób, aby spełniony był ten warunek.  
Program oblicza problem urodzin eksperymentalnie, metodą Monte Carlo – generuje daty urodzin, sprawdza ich zgodność z warunkami i znajduje najmniejszą zgodną liczbę osób.
### Instrukcja obsługi
Interakcja z użytkownikiem odbywa się przez plik menu.bat. Po uruchomieniu skryptu, na ekranie użytkownika pojawia się proste menu z możliwością wyboru jednej z czterech opcji, wybieranej poprzez naciśnięcie cyfry jej odpowiadającej, a następnie klawisza Enter:
1.	Uruchom program
2.	Wyświetl opis 
3.	Utwórz backup
4.	Wyjście

Po wybraniu jednej z opcji 1-3, użytkownik może wrócić do głównego menu, naciskając dowolny klawisz. Wybranie opcji Wyjście zamyka okienko terminala.
Użytkownik może zmienić ilość testów, które program wykonuje dla każdej testowanej liczby osób, poprzez zmianę treści pliku in.txt w folderze input.
