import logging
import os
from aiogram import Bot, Dispatcher, executor, types
from aiogram.contrib.fsm_storage.memory import MemoryStorage

API_TOKEN = os.getenv("API_TOKEN")  # Токен з environment variables

logging.basicConfig(level=logging.INFO)

bot = Bot(token=API_TOKEN)
storage = MemoryStorage()
dp = Dispatcher(bot, storage=storage)

@dp.message_handler(commands=["start"])
async def start_cmd(message: types.Message):
    await message.answer("Бот працює!")

if __name__ == "__main__":
    executor.start_polling(dp, skip_updates=True)

