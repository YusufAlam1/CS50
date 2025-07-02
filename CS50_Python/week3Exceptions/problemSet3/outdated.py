def main():
     
    repeat = True
    months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ]

    while repeat == True:
        date = input("Date: ").title()
        month = "null"

        if "," in date:
            date = date.replace(",", "")
            month, day, year, = date.split()
            if day in months or year in months:
                break
            day = int(day)

        if month in months:     
            month = int(months.index(month) + 1)
            repeat = date_checker(day, month, year)
        elif "/" in date:
            try:
                month, day, year, = map(int, date.split("/"))
            except ValueError:
                break
            repeat = date_checker(day, month, year)
        else:
            continue


def date_checker(day, month, year):
    if(day <= 31 and month <= 12):
        print(f"{year}-{month:02}-{day:02}")
        return False
    return True


def is_number(n):
    return isinstance(n, (int, float, complex))


main()