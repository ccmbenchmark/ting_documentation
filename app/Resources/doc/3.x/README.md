Installer Sphinx :
    apt-get install python-sphinx

Installer pip :
    apt-get install python-pip

Installer le système de traduction
    pip install sphinx-intl

Installer le thème rtd :
    pip install sphinx_rtd_theme

Générer la documentation :
    dans ce même répertoire taper :
        make html

Create pot (for new files, update po etc) :
    make gettext

Mettre à jour les po :
    sphinx-intl update -p source/_build/locale
