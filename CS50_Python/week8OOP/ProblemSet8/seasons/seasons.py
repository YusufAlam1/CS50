from datetime import date
import inflect
import sys

def main():
    birthdate = input("Date of Birth: ")
    try:
        years = date.fromisoformat(birthdate)
    except ValueError:
        sys.exit("Invalid date")
    
    minutes = minutes_since_birth(years)
    print(convert_to_words(minutes) + " minutes")

def minutes_since_birth(birthdate):
    today = date.today()
    timedelta = today - birthdate
    return round(timedelta.days * 24 * 60)

def convert_to_words(number):
    p = inflect.engine()
    return p.number_to_words(number, andword="").capitalize()

if __name__ == "__main__":
    main()
