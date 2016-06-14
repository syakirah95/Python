#!/usr/bin/env python
#_*_ coding: utf-8 _*_
#
#Simple Bot to reply to Telegram messages

from telegram.ext import Updater,CommandHandler,MessageHandler,Filters
import logging

#Enable logging
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    level=logging.INFO)

logger = logging.getLogger(_name_)

#Define a few command handlers.These usually take two argument bot and update.
#Error handlers also receive the raised TelegramError object in error.
def start(bot,update): bot.sendMessage(update.message.chat_id, text = 'Hi!')
def help(bot,update): bot.sendMessage(update.message.chat_id, text='Help!')
def echo(bot,update): bot.sendMessage(update.message.chat_id, text=update.message.text)
def error(bot,update,error): logger.warn('Update "%s" caused error "%s" ' % (update, error))

def main():
    #Create the EventHandler and pass it your bot's token.
    updater = Updater("TOKEN")

    #Get the dispatcher to register handlers
    dp = updater.dispatcher

    #on different commands - answer in Telegram
    dp.add_handler(CommandHandler("start",start))
    dp.add_handler(CommandHandler("help",help))

    #on noncommand i.e message - echo the message on telegram
    dp.add_handler(MessageHandler([Filters.text],echo))

    #log all errors
    dp.add_error_handler(error)

    #Start the Bot
    updater.start_polling()

if_name_=='_main_':
  main()
