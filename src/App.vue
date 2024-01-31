<template>
  <div class="flex justify-center pt-6">
    <div class="cabecalho">
      <div>
        <img src="./assets/images/logo.svg" alt="" />
      </div>
      <div class="box-score">
        <span class="titulo text-blue-600">SCORE</span> <br />
        <span class="titulo1 text-gray-600">12</span>
      </div>
    </div>
  </div>
  <div class="flex justify-center pt-6">
    <div class="p-6" @click="selectPlay(1)">Pedra</div>
    <div class="p-6" @click="selectPlay(2)">Papel</div>
    <div class="p-6" @click="selectPlay(3)">Tesoura</div>
  </div>

  <div class="flex justify-center pt-40">
    <img src="./assets/images/bg-triangle.svg" class="triangle" alt="">


    <img src="./assets/images/icon-rock.svg" class="pedra x" alt="">
    <img src="./assets/images/icon-paper.svg" class="papel x" alt="">
    <img src="./assets/images/icon-scissors.svg" class="tesoura x" alt="">
  </div>

  <div class="flex justify-center pt-6">
    <div class="p-6" v-if="playerChoice">Você escolheu {{ playerChoice }}</div>
    <div class="p-6" v-if="computerChoice">O computador escolheu {{ computerChoice }}</div>
    <div class="p-6" v-if="resultado">Resultado: {{ resultado }}</div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const playerChoice = ref(null);
const computerChoice = ref(null);
const resultado = ref(null);

const results = {
  "1-1": "Empate",
  "1-2": "Perdeu",
  "1-3": "Ganhou",
  "2-1": "Ganhou",
  "2-2": "Empate",
  "2-3": "Perdeu",
  "3-1": "Perdeu",
  "3-2": "Ganhou",
  "3-3": "Empate",
};

const startGame = () => {
  if (playerChoice.value && computerChoice.value) {
    const resultKey = `${playerChoice.value}-${computerChoice.value}`;
    resultado.value = results[resultKey];

    console.log(resultado.value);
  }
};

const selectPlay = (play) => {
  playerChoice.value = play;

  if (playerChoice.value) {
    computerChoice.value = Math.floor(Math.random() * 3) + 1;
  }

  startGame();
};
</script>

<style>
.cabecalho {
  background-color: transparent;
  padding: 30px;
  text-align: center;
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 20px;
  border-radius: 10px;
  border: 2px solid #dddcdca1;
  display: flex;
  justify-content: space-between;
  width: 1000px;
}

.box-score {
  background-color: #f2f2f2;
  width: 120px;
  height: 100px;
  border-radius: 10px;
}

.titulo {
  font-size: 12px;
  font-weight: bold;
}

.titulo1 {
  font-size: 55px;
  font-weight: bold;
}

.triangle{

  z-index: 1;
  width: 400px;
}

.pedra {
  z-index: 2;
  position: absolute;
  transform: translate(0%, 170%);
  width: 150px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 20px solid #D94169;
  padding: 35px; 
  box-shadow: inset 0px 4px 5px  rgba(0, 0, 0, 0.5), 0px 6px 0px #e21048;
  cursor: pointer;

}


.tesoura {
  z-index: 2;
  position: absolute;
  transform: translate(100%, -40%);
  width: 150px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 20px solid #F2AB27;
  padding: 35px;
  box-shadow: inset 0px 4px 5px  rgba(0, 0, 0, 0.5), 0px 6px 0px #ec9c07;
  cursor: pointer;
}

.papel {
  z-index: 2;
  position: absolute;
  transform: translate(-110%, -40%);
  width: 150px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 20px solid #577EF2;
  padding: 35px;
  box-shadow: inset 0px 4px 5px rgba(0, 0, 0, 0.5), 0px 6px 0px #1749df;
  cursor: pointer;
}

.x {
transition: all 0.5s;
}

.x:hover {
  transform: scale(1.1);
}
</style>
