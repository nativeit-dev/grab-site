#!/usr/bin/env python3

try:
	from setuptools import setup
except ImportError:
	from distutils.core import setup

import os
import sys
import libgrabsite

install_requires = [
	"click>=8.0",
	"manhole>=1.8.0",
	"lmdb>=1.3.0",
	"autobahn>=22.7.1",
	"google-re2>=1.0.6",
	"websockets>=10.0",
	"chardet>=3.0.0",
	"dnspython",
	"lxml",
	"namedlist",
	"sqlalchemy>=1.4.0,<2.0.0",
	"tornado>=6.1",
	"yapsy",
]

# Note: wpull dependency is not included in install_requires due to build issues on Windows
# For Windows development, use Docker or WSL2 where wpull dependencies compile properly
# For Docker: cd docker-grab-site && docker build -t grab-site:dev .

setup(
	name="grab-site",
	version=libgrabsite.__version__,
	description="The archivist's web crawler: WARC output, dashboard for all crawls, dynamic ignore patterns",
	url="https://ludios.org/grab-site/",
	author="Ivan Kozik",
	author_email="ivan@ludios.org",
	classifiers=[
		"Programming Language :: Python :: 3",
		"Programming Language :: Python :: 3.8",
		"Programming Language :: Python :: 3.9",
		"Programming Language :: Python :: 3.10",
		"Programming Language :: Python :: 3.11",
		"Development Status :: 5 - Production/Stable",
		"Intended Audience :: End Users/Desktop",
		"License :: OSI Approved :: MIT License",
		"Topic :: Internet :: WWW/HTTP",
	],
	python_requires='>=3.8',
	scripts=["grab-site", "gs-server", "gs-dump-urls"],
	packages=["libgrabsite"],
	package_data={"libgrabsite": ["*.html", "*.ico", "*.txt", "ignore_sets/*"]},
	install_requires=install_requires,
)
