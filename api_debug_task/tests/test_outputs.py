import requests
import time

def test_api():
    for _ in range(15):
        try:
            res = requests.get("http://127.0.0.1:8000")
            if res.status_code == 200:
                data = res.json()
                assert data.get("message") == "fixed_key"
                return
        except:
            time.sleep(1)

    assert False, "API did not respond correctly"