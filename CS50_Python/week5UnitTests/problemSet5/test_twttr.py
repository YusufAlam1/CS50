import pytest

from twttr import shorten


def test_normal():
    assert shorten("hello world") == "hll wrld"


def test_check_caps():
    assert shorten("HELLO WORLD") == "HLL WRLD"


def test_check_vowels():
    assert shorten("hll wrld") == "hll wrld"


def test_check_punctuation():
    assert shorten(",./;") == ",./;"


def test_check_nums():
    assert shorten("12345") == "12345"
