import json
# read from quiz.json


class Quiz:
    def __init(quiz_type, title, hint, point):
        self.quiz_type = quiz_type
        self.title = title
        self.hint = hint
        self.point = point
    def answer(input):
        raise Exception("not implement")

class WriteQuiz(Quiz):
    def __init(title, hint, point, answer):
        super.__init("write", title, hint, point)
        self.answer = answer

class ChoiceQuiz(Quiz):
    def __init(title, hint, point, answer, choice_list):
        super.__init("write", title, hint, point)
        self.answer = answer
        self.choice_list = choice_list

if __name__ == "__main__":
    quiz_dict = json.load(open("quiz.json"))
    for quiz in quiz_dict['quizList']:
        quiz = nil
        if quiz['type'] == 'write':
            quiz = WriteQuiz(quiz['title'], quiz['hint'], quiz['point'], quiz['answer'])
        elif quiz['type'] == 'choice':
            quiz = ChoiceQuiz(quiz['title'], quiz['hint'], quiz['point'], quiz['answer'], quiz['choiceList'])
        print(quiz.title)
        user_input = input("回答:")
        # 確認処理
        # TODO: 時間制限？
