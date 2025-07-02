import pytest

from plates import is_valid

def test_length():
    assert is_valid("A") == False
    assert is_valid("AA") == True
    assert is_valid("AAAAAAA") == False
    assert is_valid("AAAAAA") == True


def test_numbers():
    assert is_valid("123456") == False
    assert is_valid("AA0123") == False
    assert is_valid("AA12AA") == False

def test_punctuation():
    assert is_valid("AA,.;:") == False


def test_lowercase():
    assert is_valid("aaaaaa") == True
