import random

# Soldier


class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
    
    def attack(self):
       return self.strength


    def receiveDamage(self, damage):
        self.health -= damage
    

# Viking

class Viking(Soldier):
    def __init__(self, name, health, strength): 
        self.name= name
        self.health=health
        self.stregth=strength

    def receiveDamage(self, damage):
        self.health -= damage

        if self.health>0:
            return f"{self.name} ha recibido {damage} puntos de daño"
        else:
            return f"{self.name} ha muerto en el combate"

    def battleCry(self):
        return "¡Odin os posee a todos!"

# Saxon

class Saxon(Soldier):
    def __init__(self, health, strength):
        self.health=health
        self.stregth=strength

    def receiveDamage(self, damage):
        self.health -= damage

        if self.health>0:
            return f"Un 'Saxon' ha recibido {damage} puntos de daño"
        else:
            return f"Un 'Saxon' ha muerto en combate"

# Davicente

class War():
    def __init__(self):
        # your code here
        self.vikingArmy=[]
        self.saxonArmy=[]
    def addViking(self, viking):
        # your code here
        self.vikingArmy.append(viking)
    
    def addSaxon(self, saxon):
        # your code here
        self.saxonArmy.append(saxon)
    
    def vikingAttack(self):
        # your code here
        rand_sax_index=random.randint(0,len(self.saxonArmy))
        rand_saxon=self.saxonArmy[rand_sax_index]
        rand_viking=self.vikingArmy[random.randint(0,len(self.vikingArmy))]
        grito_saxon=rand_saxon.receiveDamage(rand_viking.strength)
        if rand_saxon.health<1:
            self.saxonArmy.pop(rand_sax_index)

        return grito_saxon

    def saxonAttack(self):
        # your code here
        rand_vik_index=random.randint(0,len(self.vikingArmy))
        rand_saxon = self.saxonArmy[random.randint(0, len(self.saxonArmy))]
        rand_viking = self.vikingArmy[rand_vik_index]
        grito_viking=rand_viking.receiveDamage(rand_saxon.strength)
        if rand_viking.health<0:
            self.vikingArmy.pop(rand_vik_index)
        return grito_viking

    def showStatus(self):
        # your code here
        if len(self.saxonArmy)<0:
            return "¡Los Vikingos han ganado la guerra del siglo!"

        if len(self.vikingArmy) < 0:
            return "Los Sajones han luchado por sus vidas y sobreviven otro día..."

        return "Los Vikingos y los Sajones todavía están en plena batalla."
    pass

%run "1-testsSoldier.py" --v


