import re
import sys


def main():
    print(parse(input("\nHTML: ")))


def parse(s):
    print()
    if match := re.search(r"<iframe.+https?://(?:www\.)?youtube\.com/embed/([a-zA-Z0-9_-]+)", s):
        return(f"https://youtu.be/{match.group(1)}")
    else:
        return match


if __name__ == "__main__":
    main()

# $ python watch.py                                                               
# HTML: <iframe width="560" height="315" src="https://www.youtube.com/embed/xvFZjo5PgG0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullsc
# reen></iframe>                                                                  
# https://youtu.be/xvFZjo5PgG0                                                    
# $ python watch.py                                                               
# HTML: <iframe src="https://www.youtube.com/embed/xvFZjo5PgG0"></iframe>         
# https://youtu.be/xvFZjo5PgG0    