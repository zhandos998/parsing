from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
# from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
# from webdriver_manager.chrome import ChromeDriverManager
# import send_to_server
import connect2db
import os
import json
ID = 1

def get_contacts(page):
    os.system('cls')  # clear cmd
    soup = BeautifulSoup(page, "html.parser")
    pane_side = soup.find('div', id='pane-side')
    listitem = pane_side.find_all('div', attrs={'role': ['listitem']})
    data_list=[]
    for item in listitem:
        data={
            "href":"",
            "subtitle":"",
            "user_name":"",
            "message_time":"",
            "unread":"",
        }

        # data-testid="cell-frame-container"
        # data-testid="cell-frame-title"
        # data-testid="cell-frame-secondary"
        # data-testid="cell-frame-primary-detail"
        try:
            title = item.find('div', attrs={'data-testid': ['cell-frame-title']})
            title = title.getText()
            if 30<len(title):
                title = title[:30]
                title += "..."
            data["href"] = title
        except:
            print("href error")
        try:
            secondary = item.find('div', attrs={'data-testid': ['cell-frame-secondary']})
            data["subtitle"] = secondary.getText()
            if 30<len(data["subtitle"]):
                data["subtitle"] = data["subtitle"][:30]
                data["subtitle"] += "..."
        except:
            print("subtitle error")
        try:
            title = item.find('div', attrs={'data-testid': ['cell-frame-title']})
            title = title.getText()
            if 30<len(title):
                title = title[:30]
                title += "..."
            data["user_name"] = title
        except:
            print("href error")
        try:
            title = item.find('div', attrs={'data-testid': ['cell-frame-primary-detail']})
            title = title.getText()
            data["message_time"] = title
        except:
            print("message_time error")
        try:
            data["unread"] = None
            if data["unread"]:
                data["unread"] = data["unread"].getText()
        except:
            print("unread error")
        data_list.append(data)
    return data_list

def get_chats(href):
    # audio_list=[]
    # role="application"
    # btn_send = driver.find_element(By.XPATH, "//div[@data-testid='cell-frame-container']")
    chatlist_classes = driver.find_elements(By.XPATH, "//div[@data-testid='cell-frame-container']")

    chatlist_classes = driver.find_elements(By.CLASS_NAME, "chatlist")
    a_tags = chatlist_classes[0].find_elements(By.TAG_NAME, "a")
    for a in a_tags:
        if a.get_attribute("href").find(href) >= 0:
            a.find_element(By.CLASS_NAME, "c-ripple").click()
            time.sleep(1)
            try:
                driver.find_elements(By.CLASS_NAME, "bubbles-go-down").click()
                time.sleep(1)
            except:
                pass
            page = driver.page_source
            soup = BeautifulSoup(page, "html.parser")
            bubbles_inner = soup.find('div', class_='bubbles-inner')
            bubbles_date_groups = bubbles_inner.findAll(
                'section', class_='bubbles-date-group')
            messages_list = []
            for bubbles_date_group in bubbles_date_groups:

                bubbles = bubbles_date_group.findAll('div', class_='bubble')
                for bubble in bubbles:
                    data = {
                        'who':"",
                        'date':"",
                        'time':"",
                        'content':"",
                    }
                    # get date
                    date = bubbles_date_group.find('span', class_='i18n')
                    data['date'] = date.getText()
                    if 'class' in bubble.attrs and 'is-in' in bubble.attrs['class']:
                        data['who']=1
                    else:
                        data['who']=0
                        # attachment
                    # message
                    message = bubble.find('div', class_='message')
                    if message:
                        for content in message.contents:
                            if type(content)==type(BeautifulSoup(page, "html.parser").find("div")):
                                if 'alt' in content.attrs:
                                    data['content'] += content.attrs['alt']
                            else:
                                data['content'] += content
                        # data['content'] = message.contents[0] if isinstance(message.contents[0], str) else ""
                        inner = message.find('div', class_='inner')
                        if inner:
                            data['time'] = inner.attrs['title']
                        audio = message.find('audio-element')
                        if audio:
                            data['content'] += "This is audio element"
                        avatar = message.find('avatar-element')
                        if avatar:
                            contact_name = message.find('div', class_='contact-name')
                            contact_number = message.find('div', class_='contact-number')
                            if contact_name and contact_number:
                                data['content'] += contact_name.getText() + " | " + contact_number.getText()+'\n'
                    # attachment
                    attachment = bubble.find('div', class_='attachment')
                    if attachment:
                        # big emojies
                        if 'data-sticker-emoji' in attachment.attrs:
                            data['content'] += attachment.attrs['data-sticker-emoji']+'\n'
                        # mini emojies
                        imgs = attachment.findAll('img')
                        for img in imgs:
                            if 'alt' in img.attrs:
                                data['content'] +=img.attrs['alt']+'\n'
                            else:
                                data['content'] +='[image: ' + img.attrs['src'] + ' ]'+'\n'
                        
                        videos = attachment.findAll('video')
                        for video in videos:
                            if 'src' in img.attrs:
                                data['content'] += '[video: ' + video.attrs['src'] + ' ]'+'\n'
                        
                        geo_container = attachment.find('a',class_="geo-container")
                        if geo_container:
                            data['content'] += geo_container.attrs['href']+'\n'
                    # reply
                    reply = bubble.find('div', class_='reply')
                    if reply:
                        reply_text=""
                        if 'class' in reply.attrs and 'is-media' in reply.attrs['class']:
                            img = reply.find('img')
                            if img and 'src' in img.attrs:
                                reply_text +='[image: ' + img.attrs['src'] + ' ]'+'\n'

                        reply_subtitle = reply.find('div', class_='reply-subtitle')
                        for content in reply_subtitle.contents:
                            if type(content)==type(BeautifulSoup(page, "html.parser").find("div")):
                                if 'alt' in content.attrs:
                                    reply_text += content.attrs['alt']
                                else:
                                    reply_text += content.getText()

                            else:
                                reply_text += content

                        data['content'] = reply_text+'\n'+'->\n'+data['content']
                    messages_list.append(data)
            break
    # for i in messages_list:
    #     print(i)
    return messages_list

# def send_message(text):
#     if (len(text)>=1):
#         # btn_send = driver.find_element(By.CLASS_NAME, "btn-send")
#         btn_send = driver.find_element(By.XPATH, "//div[@data-testid='cell-frame-container']")
#         btn_send.send_keys(text)
#         btn_send.click()
#     pass

driver = webdriver.Chrome()
driver.get("https://web.whatsapp.com/")
while True:

    try:
        # f = open("whatsapp.html", "r")
        # page = f.read()
        page = driver.page_source
        data = get_contacts(page)
        contacts_data = {
            "id" : ID,
            # "func" : "contacts_json",
            "messenger" : "whatsapp",
            "data": json.dumps(data, ensure_ascii=False),
        }
        
        connect2db.send_to_db_contact(contacts_data)
        result = connect2db.get_link_db(ID)
        data = get_chats("Дарига")
        print(data)
        # if result[2]==None:
        #     data = get_chats(result[1])
            
        #     chats_data = {
        #         "id" : ID,
        #         # "func" : "chat_json",
        #         # "messenger" : "telegram",
        #         "data": json.dumps(data, ensure_ascii=False),
        #     }
        #     connect2db.send_to_db_chat(chats_data)
    
    except:
        "Not found!"

    time.sleep(1)


driver.close()


Zz87713985075
