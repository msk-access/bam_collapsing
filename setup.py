#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

with open('README.md') as readme_file:
    readme = readme_file.read()

requirements = ['toil[all]==5.10.0', ]

setup_requirements = [
    'pytest-runner', ]

test_requirements = ['pytest', ]

setup(
    author="Ronak Shah",
    author_email='rons.shah@gmail.com',
    classifiers=[
        'Development Status :: 2 - Beta',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Natural Language :: English',
        'Programming Language :: Python :: 3.6',
    ],
    description="Collapsing of reads a  aligned to the genome having same unique molecular identifier",
    install_requires=requirements,
    license="Apache Software License 2.0",
    long_description=readme + '\n\n',
    include_package_data=True,
    keywords='bam_collapsing',
    name='bam_collapsing',
    packages=find_packages(include=['bam_collapsing']),
    setup_requires=setup_requirements,
    test_suite='tests',
    tests_require=test_requirements,
    url='https://github.com/msk-access/bam_collapsing',
    version='1.0.0',
    zip_safe=False,
)
