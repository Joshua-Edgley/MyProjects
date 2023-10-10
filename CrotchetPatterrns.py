from graphics import *


def userinputs():
    patchworksize = ''
    colours = ['', '', '']
    colouroptions = ['red', 'green', 'blue', 'purple', 'orange', 'cyan']
    patchworksize = str(input('How big do you want the patchwork to be? (5 or 7) '))
    while patchworksize != '5' and patchworksize != '7':  # checks if inputted patch work size is valid
        print('\n'
              'INVALID: please enter either 5 or 7.\n'
              '')
        patchworksize = str(input('How big do you want the patchwork to be? (5 or 7) '))
    print('\n'
          'colours: red, green, blue, purple, orange, cyan')
    patchworksize = int(patchworksize)
    for i in range(3):
        valid = False  # checks if the inputted colour is valid
        while valid is False:
            colours[i] = str(input('\n'
                                   'Enter colour {0}: '.format(i + 1)))
            if colours[i] not in colouroptions:
                print('The colour you entered is not valid! please enter one of the colours listed above.')
            else:
                valid = True

    patchworkdesign(patchworksize, colours)


def patchworkdesign(patchworksize, colours):
    frame = patchworksize * 100
    innerframe = frame - 100
    win = GraphWin('Patchwork', frame, frame)
    win.setBackground('white')
    mark = 0
    for y in range(0, frame, 100):
        mark = mark + 100
        for x in range(0, frame, 100):
            if x == y:
                patchcolour = colours[0]
                finpatch(x, y, win, patchcolour)
            elif x > 0 and y == 0 or 0 < y < innerframe and x == innerframe:
                patchcolour = colours[1]
                finpatch(x, y, win, patchcolour)
            elif x == 0 and y > 0 or y == innerframe and 0 < x < innerframe:
                patchcolour = colours[2]
                blankpatch(x, y, win, patchcolour)
            elif mark <= x < innerframe and y >= 100:
                patchcolour = colours[1]
                blankpatch(x, y, win, patchcolour)
            elif 100 <= x < mark + 100 and y >= 200:
                patchcolour = colours[2]
                penpatch(x, y, win, patchcolour)

    challengefeature(win, colours)

    win.getMouse()


def penpatch(xpos, ypos, win, patchcolour):
    for y in range(0, 100, 20):
        for x in range(0, 100, 20):
            p = Polygon(Point(xpos + x, ypos + y), Point(xpos + x, ypos + y + 10), Point(xpos + x + 10, ypos + y + 19),
                        Point(xpos + x + 20, ypos + y + 10), Point(xpos + x + 20, ypos + y),
                        Point(xpos + x + 10, ypos + y + 10))
            p.setFill(patchcolour)
            p.setOutline(patchcolour)
            if x == 20 and y == 20 or x == 60 and y == 20 or x == 20 and y == 60 or x == 60 and y == 60:
                p.setFill('')
            p.draw(win)


def finpatch(xpos, ypos, win, patchcolour):
    def draw():
        l.draw(win)
        l.setFill(patchcolour)

    for x in range(0, 100, 20):
        l = Line(Point(xpos + 0, ypos + 80 - x),
                 Point(xpos + x + 20, ypos + 100))  # draws first 5 lines going to the top right
        draw()
        l = Line(Point(xpos + x, ypos + 0),
                 Point(xpos + 100, ypos + 100 - x))  # draws the rest of the lines going to the top right
        draw()
        l = Line(Point(xpos + 100 - x, ypos + 0),
                 Point(xpos + 0, ypos + 100 - x))  # draws the first 5 line going to the bottom right
        draw()
        l = Line(Point(xpos + 100, ypos + x),
                 Point(xpos + x, ypos + 100))  # draws the rest of the lines going towards the bottom right
        draw()


def blankpatch(xpos, ypos, win, patchcolour):
    r = Rectangle(Point(xpos, ypos), Point(xpos + 100, ypos + 100))
    r.setFill(patchcolour)
    r.setOutline('')
    r.draw(win)


def challengefeature(win, colours):

    print("\n"
          "\n"
          "You can now select a patch (using a mouse) and perform the following operations (using a keyboard):\n"
          "\n"
          "      -D:           Delete patch.\n",
          "     -1, 2, 3:     Create a new plain patch of colour 1, 2 and 3 respectively.\n",
          "     -4, 5, 6:     Create a new penultimate-digit patch of colour 1, 2 and 3, respectively.\n",
          "     -7, 8, 9:     Create a new final-digit patch of colour 1, 2, and 3, respectively.\n",
          "     -ARROW KEYS:  Moves the selected patch to an adjacent empty space in the direction inputted via the arrows "
          "keys.\n",
          "     -ESC:         Deselects the current patch.\n"
          "\n"
          "(COLOURS: {0})".format(colours))


    while True:
        select = win.getMouse()
        xpoint = select.getX()
        ypoint = select.getY()
        for y in range(0, 500, 100):
            for x in range(0, 500, 100):
                if x < xpoint < x + 100 and y < ypoint < y + 100:

                    hl = Rectangle(Point(x, y), Point(x + 100, y + 100))  # hl standing for High light/ draws the selected outline
                    hl.setWidth(10)
                    hl.draw(win)

                    key = win.getKey()

                    if key == 'd':
                        blankpatch(x, y, win, 'white')
                        hl.undraw()

                    elif key == 'Escape':
                        hl.undraw()

                    elif key == '1' or '2' or '3' or '4' or '5' or '6' or '7' or '8' or '9':
                        blankpatch(x, y, win, 'white')
                        if int(key) <= 3:
                            blankpatch(x, y, win, colours[int(key) - 1])
                        elif 3 < int(key) <= 6:
                            penpatch(x, y, win, colours[int(key) - 4])
                        else:
                            finpatch(x, y, win, colours[int(key) - 7])
                        hl.undraw()


                    #elif key == 'Up' or 'Down' or 'Right' or 'Left':

userinputs()