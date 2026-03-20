# devops_task
AI-Powered Self-Healing API
This project demonstrates a self-healing system where an AI agent detects and corrects a common dependency error in a FastAPI application.

API Architecture
The API is built with FastAPI and Uvicorn. It exposes a single endpoint:

GET / – Returns {"message": "Hello World"}

The healing mechanism is implemented in an external supervisor script (ai_healer.py) that orchestrates startup, error detection, and automated remediation using a Large Language Model.

Intentional Error
The file environments/requirements.txt contains a typo: fastpi; uvicorn

The correct package name is fastapi. This error causes pip install to fail with:

ERROR: No matching distribution found for fastpi
Why This Error Is Common
This error frequently occurs in Python projects due to:

Manual typos when writing requirement files

Copy-pasting from unreliable sources or outdated tutorials

Absence of automated validation against PyPI before deployment

The similarity between package names, making typos easy to overlook

AI Correction Process
The supervisor script executes the following loop:

Attempts to install dependencies and start the API server

Captures any error output from the failed installation

Sends the error log to an LLM with a prompt to identify the incorrect package name and suggest the correct one

Receives a structured response containing the erroneous and corrected package names

Updates environments/requirements.txt with the correction

Retries the installation and startup process

Verifies the API is healthy

The AI identifies fastpi as a typo of fastapi by recognizing it as a known package in the Python ecosystem.

Running the System

Set your OpenAI API key:
export OPENAI_API_KEY="your-key-here"
Execute the healer script:

python ai_healer.py
The script will display the failure, the AI correction, and the successful startup.

Verify the API:curl http://localhost:8000/