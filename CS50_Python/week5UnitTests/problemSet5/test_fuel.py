import pytest

from fuel import convert, gauge


def test_convert():
    assert convert("4/5") == 80
    assert convert("0/1") == 0


def test_errors():
    with pytest.raises(ValueError):
        convert("cat/dog")
    with pytest.raises(ZeroDivisionError):
        convert("1/0")


def test_gauge():
    assert gauge(1) == "E"
    assert gauge(99) == "F"
    assert gauge(50) == "50%"