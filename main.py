from fastapi import FastAPI
import uvicorn


app = FastAPI()

@app.get("/")
async def welocome():
    return {"message": "It is working!"}


if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8088, reload=True)
