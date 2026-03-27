##This is a simple agent built with adk, there are two important endpoints when considering using the application.

1. **The create session endpoint**
--
This endpoints helps the llm remembers conversation history of different users and to begin interacting with the agent you need to create a session.
An example of creating a new session for user_123 using curl

```bash
curl -X POST "http://127.0.0.1:8000/apps/capital_agent/users/user_123/sessions/session_abc" \
    -H "Content-Type: application/json" \
    -d '{"preferred_language": "English", "visit_count": 5}'
```
--
2. **The query endpoint**
--
This endpoint is used to interact with the agents.
Key parameters that can be changed:
- user_id: The person interating with the agent (Should be already created with the create session endpoint)
- session_id: The session interaction with the agent (Should be already created with the create session endpoint)
- text: This would contain the user query

An example of running a query using curl with an already created session.

```bash
curl -X POST "http://127.0.0.1:8000/run" \
-H "Content-Type: application/json" \
-d '{
  "app_name": "capital_agent",
  "user_id": "user_123",
  "session_id": "session_abc",
  "new_message": {
    "role": "user",
    "parts": [
      { "text": "Hello" }
    ]
  }
}'
```
--
**Fixes:**

if a query is ran and you get this as a return. ``{"detail":"Session not found: session_abc"}``, This means the session has not been created.

**Extras:**

If you want a web ui interface without having to deal with endpoints issues

3. **Web UI endpoint**

This endpoint opens a ui in your browser to interact with the agent. 
An example of the endpoint is: 
```
http://127.0.0.1:8000/dev-ui
```
- Adding `/dev-ui` to the link opens a user interface in the browser.
