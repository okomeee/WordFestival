# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  LOOPNUM=100
  getRandomIntInclusive = (min, max) ->
    min = Math.ceil(min)
    max = Math.floor(max)
    Math.floor(Math.random() * (max - min + 1)) + min

  shuffule = (array) ->
    i = array.length - 1
    while i >= 0
      # 0~iのランダムな数値を取得
      rand = Math.floor(Math.random() * (i + 1))
      # 配列の数値を入れ替える
      tmp = array[i]
      array[i] = array[rand]
      array[rand] = tmp
      i--
    return array

  setColor = () ->
    color = []
    step = 0
    while step < LOOPNUM
      num1 = getRandomIntInclusive(0,255).toString(16).toUpperCase()
      num2 = getRandomIntInclusive(0,255).toString(16).toUpperCase()
      num3 = getRandomIntInclusive(0,255).toString(16).toUpperCase()
      color.push( "#" + num1 + num2 + num3 )
      step++
    console.log(color)
    return color

  # setInterval("location.reload()", 600000); # 10分に1回word更新
  # ViewPortを取得
  vw = window.innerWidth;
  vh = window.innerHeight;

  w = [];
  step = 0
  while step < LOOPNUM
    w.push($(".word"+step))
    step++

  w_pos = [];
  step = 0
  while step < LOOPNUM
    x = getRandomIntInclusive(1,1000)
    y = getRandomIntInclusive(1,1000)
    w_pos.push({
      'x': vw * x / 1000
      'y': vh * y / 1000
    })
    step++

  cnt = 0
  color = setColor()
  # ループ処理
  loop_do = ->
    # requestAnimFrame loop_do
    setTimeout loop_do, 1000 / 25
    step = 0
    while step < LOOPNUM
      if step % 2 == 0
        random = getRandomIntInclusive(1, 3);
      else if step % 3 == 0
        random = getRandomIntInclusive(4, 6);
      else
        random = getRandomIntInclusive(7, 9);

      n = step
      # ループ毎にxを加算
      w_pos[n].x += random
      w_pos[n].y += random
      # 文字を動かす
      w[n].css
        'top': String(w_pos[n].y) + 'px'
        'left': String(w_pos[n].x) + 'px'
        'color': color[n]
      
      if w_pos[n].x > vw - w[n].outerWidth(true) * 1.1 or w_pos[n].x < 0
        w_pos[n].x = 0
      if w_pos[n].y > vh - w[n].outerHeight(true) * 1.1 or w_pos[n].y < 0
        w_pos[n].y = 0
      
      step++
    cnt++
    if cnt > 1000
     color = setColor()
     cnt = 0

  
    

  window.requestAnimFrame = do ->
    window.requestAnimationFrame or window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback) ->
      window.setTimeout callback, 1000 / 60
      return

  loop_do()

# ---
# generated by js2coffee 2.2.0