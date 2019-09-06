#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

with open('README.rst') as readme_file:
    readme = readme_file.read()

with open('HISTORY.rst') as history_file:
    history = history_file.read()

requirements = [
    'pip==19.2.1'
    'bumpversion==0.5.3'
    'wheel==0.33.4'
    'watchdog==0.9.0'
    'flake8==3.7.8'
    'tox==3.13.2'
    'coverage==4.5.4'
    'Sphinx==2.1.2'
    'twine==1.13.0'
    'pytest==5.0.1'
    'pytest-runner==5.1'
    'toil-ionox0[cwl]==0.0.7'
    'pytz'
    'typing==3.7.4'
    'ruamel.yaml==0.15.77'
    'travis-wait-improved==0.0.4'
    'pytest-travis-fold==1.3.0'
]

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
        'Programming Language :: Python :: 3.7',
    ],
    description="Collapsing of reads a  aligned to the genome having same unique molecular identifier",
    install_requires=requirements,
    license="Apache Software License 2.0",
    long_description=readme + '\n\n' + history,
    include_package_data=True,
    keywords='bam_collapsing',
    name='bam_collapsing',
    packages=find_packages(include=['bam_collapsing']),
    setup_requires=setup_requirements,
    test_suite='tests',
    tests_require=test_requirements,
    url='https://github.com/rhshah/bam_collapsing',
    version='0.1.0',
    zip_safe=False,
)
