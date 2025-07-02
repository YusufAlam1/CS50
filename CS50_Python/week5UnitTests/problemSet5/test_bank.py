import pytest

from bank import value


def test_normal():
    assert value("hello") == 0
    assert value("Hello") == 0
    assert value("HELLO") == 0
    assert value("hi there") == 20
    assert value("goodbye") == 100


def test_partial_hello():
    assert value("well hello there") == 100


def test_no_h():
    assert value("greetings") == 100


def test_values():
    with pytest.raises(AttributeError):
        value(1234)
