import consumer from "./consumer";

const initClassroomCable = () => {
  const questionsContainer = document.getElementById('questions-container');
  console.log(questionsContainer)
  if (questionsContainer) {
    const id = questionsContainer.dataset.classroomId;
    console.log(id);

    consumer.subscriptions.create({ channel: "ClassroomChannel", id: id }, {
      connected: console.log("Qualquer coisa"),
      received(data) {
        questionsContainer.insertAdjacentHTML('beforeend', data);
        console.log("Alguma coisa")
      },
    });
  }
}

export { initClassroomCable };
