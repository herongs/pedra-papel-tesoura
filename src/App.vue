<template>
  <div class="mx-auto background-cor">
    <div class="flex justify-center pt-6">
      <div class="cabecalho">
        <div>
          <img src="./assets/images/logo.svg" alt="" />
        </div>
        <div class="flex">
          <div class="box-score">
            <span class="titulo text-blue-600">SCORE</span> <br />
            <span class="titulo1 text-gray-600">{{ playerScore }}</span>
          </div>
        </div>
      </div>
    </div>
    <div
      v-if="playerChoice == null"
      class="relative flex justify-center pt-40 w-[34rem] h-fit mx-auto"
    >
      <img src="./assets/images/bg-triangle.svg" class="triangle" alt="" />
      <img
        src="./assets/images/icon-rock.svg"
        class="pedra absolute top-14 left-0 hover:scale-105"
        alt=""
        @click="selectPlay(1)"
      />
      <img
        src="./assets/images/icon-paper.svg"
        class="papel absolute top-14 right-0 hover:scale-105"
        alt=""
        @click="selectPlay(2)"
      />
      <img
        src="./assets/images/icon-scissors.svg"
        class="tesoura absolute -bottom-14 left-1/6 hover:scale-105"
        alt=""
        @click="selectPlay(3)"
      />
    </div>

    <div class="flex justify-between pt-16 w-[60rem] mx-auto">
      <div v-if="playerChoice" class="text-center">
        <span class="">VOCÊ SELECIONOU</span>
        <img
          v-if="playerChoice === 1"
          src="./assets/images/icon-rock.svg"
          class="pedra-selected mt-16"
          alt=""
        />
        <img
          v-else-if="playerChoice === 2"
          src="./assets/images/icon-paper.svg"
          class="papel-selected mt-16"
          alt=""
        />
        <img
          v-else-if="playerChoice === 3"
          src="./assets/images/icon-scissors.svg"
          class="tesoura-selected mt-16"
          alt=""
        />
      </div>

      <div v-if="resultado" class="text-center pt-40">
        <div v-if="resultado === 'Ganhou'">
          <h1 class="text-4xl text-white">VOCÊ GANHOU</h1>
        </div>
        <div v-else-if="resultado === 'Perdeu'">
          <h1 class="text-4xl text-white">VOCÊ PERDEU</h1>
        </div>
        <div v-else-if="resultado === 'Empate'">
          <h1 class="text-4xl text-white">EMPATE</h1>
        </div>
        <div>
          <button
            class="btn btn-novo p-4 mt-4 rounded-lg"
            color="white"
            @click="restartGame"
          >
            JOGAR NOVAMENTE
          </button>
        </div>
      </div>

      <div v-if="computerChoice" class="text-center">
        <span class="">A CASA SELECIONOU</span>
        <img
          v-if="computerChoice === 1"
          src="./assets/images/icon-rock.svg"
          class="pedra-selected mt-16"
          alt=""
        />
        <img
          v-else-if="computerChoice === 2"
          src="./assets/images/icon-paper.svg"
          class="papel-selected mt-16"
          alt=""
        />
        <img
          v-else-if="computerChoice === 3"
          src="./assets/images/icon-scissors.svg"
          class="tesoura-selected mt-16"
          alt=""
        />
      </div>
    </div>

    <div
      v-if="!resultado"
      class="flex justify-end w-[60rem] mx-auto pt-14 pb-4 bottom-0 right-0"
    >
      <button
        class="btn btn-regras p-4 rounded-lg"
        color="white"
        onclick="my_modal_1.showModal()"
      >
        REGRAS
      </button>

      <dialog id="my_modal_1" class="modal">
        <div class="modal-box bg-white text-center">
          <h1 class="font-bold text-lg pb-6 pt-2">REGRAS</h1>
          <div style="text-align: center">
            <img
              src="./assets/images/image-rules.svg"
              alt=""
              class="align-center"
              style="display: inline-block; width: 400px"
            />
          </div>
          <div class="modal-action">
            <form method="dialog">
              <button class="btn btn-ghost">FECHAR</button>
            </form>
          </div>
        </div>
      </dialog>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const playerChoice = ref(null);
const computerChoice = ref(null);
const resultado = ref(null);
const playerScore = ref(5);

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

    if (resultado.value === "Ganhou") {
      playerScore.value = playerScore.value + 1;
    } else if (resultado.value === "Perdeu") {
      playerScore.value = playerScore.value - 1;
    }
  }
};

const selectPlay = (play) => {
  playerChoice.value = play;

  if (playerChoice.value) {
    computerChoice.value = Math.floor(Math.random() * 3) + 1;

    if (computerChoice.value == playerChoice.value) {
      playerScore.value = playerScore.value + 1;
    }
  }

  startGame();
};

const restartGame = () => {
  playerChoice.value = null;
  computerChoice.value = null;
  resultado.value = null;
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

.triangle {
  width: 400px;
}

.pedra {
  z-index: 2;
  width: 220px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 30px solid #d94169;
  padding: 50px;
  box-shadow: inset 0px 7px 5px rgba(0, 0, 0, 0.5), 0px 7px 0px #e21048;
  cursor: pointer;
}

.pedra-selected {
  z-index: 2;
  width: 320px;
  background-color: #f2f2f2;
  border-radius: 50%;
  height: 320px;
  border: 35px solid #d94169;
  padding: 60px;
  box-shadow: inset 0px 7px 5px rgba(0, 0, 0, 0.5), 0px 7px 0px #e21048;
  cursor: pointer;
}

.tesoura {
  z-index: 2;
  width: 220px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 30px solid #f2ab27;
  padding: 50px;
  box-shadow: inset 0px 7px 5px rgba(0, 0, 0, 0.5), 0px 7px 0px #ec9c07;
  cursor: pointer;
}

.tesoura-selected {
  z-index: 2;
  width: 320px;
  height: 320px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 35px solid #f2ab27;
  padding: 60px;
  box-shadow: inset 0px 7px 5px rgba(0, 0, 0, 0.5), 0px 7px 0px #ec9c07;
  cursor: pointer;
}

.papel {
  z-index: 2;
  width: 220px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 30px solid #577ef2;
  padding: 50px;
  box-shadow: inset 0px 7px 5px rgba(0, 0, 0, 0.5), 0px 7px 0px #1749df;
  cursor: pointer;
}

.papel-selected {
  z-index: 2;
  width: 320px;
  height: 320px;
  background-color: #f2f2f2;
  border-radius: 50%;
  border: 35px solid #577ef2;
  padding: 60px;
  box-shadow: inset 0px 7px 5px rgba(0, 0, 0, 0.5), 0px 7px 0px #1749df;
  cursor: pointer;
}

.btn-novo {
  --btn-color: white !important;
  --btn-bg: #f2f2f2 !important;
  background-color: white !important;
  width: 200px;
}

.btn-regras {
  --btn-color: white !important;
  --btn-bg: #f2f2f2 !important;
}

.background-cor {
  background: radial-gradient(circle, hsl(214, 47%, 23%), hsl(237, 49%, 15%));
  min-height: 100vh;
}
</style>
