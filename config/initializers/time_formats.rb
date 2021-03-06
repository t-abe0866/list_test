Time::DATE_FORMATS[:datetime_jp] = "%Y/%m/%d %H:%M"

# 日付表記は下記の通り
#   yyyy/mm/dd
#   (例 : 2002/08/01)
#
# 時間の表記は下記の通り
#   ・時間: 分 :秒まで表記する場合
#     hh:mm:ss
#     (例 : PM 10 時  3 分   4 秒 → 22 : 03 : 04
#            AM  3 時 11 分 59 秒 →03 : 11 : 59)
#   ・時間: 分 まで表記する場合
#     hh:mm
#     (例 : PM 10 時  3 分 → 22 : 03
#            AM  3 時 11 分 → 03 : 11)
# 日付 + 時間 表記は下記の通り
#   yyyy/mm/dd hh:mm
#   (例 : 2002/08/01 22 : 03)
