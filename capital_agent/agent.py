from google.adk.agents import Agent

root_agent = Agent(
      name = "text_summarizer_agent",
      model = "gemini-2.5-flash",
      description = "A text summarizer agent that summarises users text",
      instruction = """
      You are an AI Assistant that summarises users text while keeping the writers tone and key factual points
      """,)
      
      

