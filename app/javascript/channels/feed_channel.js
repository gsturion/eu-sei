import consumer from "./consumer";

const initClassroomCable = () => {
  const questionContainer = document.getElementById('question');
  if (questionContainer) {
    const id = questionContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        questionContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initClassroomCable };
