# coding: utf-8
require 'mechanize'

dep = "若葉町（長崎）"
arr = "長崎駅前"

agent = Mechanize.new
step1 = agent.get('https://www.keneibus.jp/local/timetable/')

# バス停名を入れるフォームを指定
form1 = step1.forms[0]

# 出発のバス停をセット
form1.kwd = dep
step2 = agent.submit(form1).link_with(:text => dep).click

# 到着のバス停をセット
form2 = step2.forms[0]
form2.kwd = arr
step3 = agent.submit(form2).link_with(:text => arr).click

# 時刻順一覧を取得
p step3.form_with(:name => 'form2').click_button.body.toutf8
