import pytest

from numb3rs import validate

def test_validate():
    assert validate("123.000.000.000") == True
    assert validate("123.000.000.000.000") == False