FROM censored/ha-test-dev:persist

RUN pip install -r /data/home-assistant/requirements_test_all.txt \
                -c /data/home-assistant/homeassistant/package_constraints.txt

CMD cd /data/home-assistant ;\
    git fetch ;\
    git reset --hard origin/censored-dev ;\
#    tox -r tests/components/media_player/test_cast.py
    pytest tests/components/media_player/test_cast.py
