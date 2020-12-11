import consumer from "./consumer";

const initClassroomCable = () => {
  const questionsContainer = document.getElementById('questions-container');
  if (questionsContainer) {
    const id = questionsContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ClassroomChannel", id: id }, {
      received(data) {
        // questionsContainer.insertAdjacentHTML('beforeend', data);
        console.log(data)
      },
    });
  }
}

export { initClassroomCable };
