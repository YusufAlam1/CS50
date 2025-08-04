from seasons import minutes_since_birth, convert_to_words
from datetime import date, timedelta

def test_minutes_since_birth():
    assert minutes_since_birth(date.today() - timedelta(days=1)) == 1440
    assert minutes_since_birth(date.today() - timedelta(days=365)) == 525600

def test_convert_to_words():
    assert convert_to_words(1440) == "One thousand, four hundred forty"
    assert convert_to_words(525600) == "Five hundred twenty-five thousand, six hundred"
