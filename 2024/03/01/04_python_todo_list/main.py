import sys
import json
import uuid
import os

class Task:
    def __init__(self, id = None, title="", priority=1, status=1):
        self.id = id if id is not None else str(uuid.uuid4())
        self.title = title
        self.priority = priority
        self.status = status

class TaskList:
    def __init__(self, filepath):
        self.filepath = filepath
        if not os.path.exists(filepath):
            with open(self.filepath, 'w') as f:
                f.write("{}")
        self.read_json()

    def read_json(self):
        with open(self.filepath) as f:
            self.dict_data = json.loads(f.read())
        tasks = []
        for id in self.dict_data:
            task = self.dict_data[id]
            tasks.append(Task(id, task['title'], task['priority'], task['status']))

        self.tasks = tasks

    def deploy(self):
        self.write_json()
        self.read_json()

    def write_json(self):
        with open(self.filepath, 'w') as f:
            json.dump(self.dict_data, f)

    def insert(self, task, is_deploy = True):
        self.dict_data[task.id] = {
            "title": task.title,
            "priority": task.priority,
            "status": task.status,
        }
        if is_deploy:
            self.deploy()

    def delete(self, id, is_deploy = True):
        del self.dict_data[id]
        if is_deploy:
            self.deploy()

    def update(self, id, task):
        self.delete(id, False)
        self.insert(task, False)
        self.deploy()

    def list(self):
        for i, task in enumerate(self.tasks):
            print(f"[{i}]{task.id}: \n\tタスク名:{task.title}\n\t優先度: {task.status}\n")

TODO_FILE_PATH = './todo.json'

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("too few args.")
        exit()
    cmd = sys.argv[1]
    argv = sys.argv
    match cmd:
        case 'list':
            tl = TaskList(TODO_FILE_PATH)
            tl.list()
        case 'add':
            if len(sys.argv) < 5:
                print(f"too few {cmd} args.")
                exit()
            tl = TaskList(TODO_FILE_PATH)
            title = argv[2]
            priority = int(argv[3])
            status = int(argv[4])
            tl.insert(Task(None, title, priority, status))
            tl.list()
        case 'del':
            if len(sys.argv) < 3:
                print(f"too few {cmd} args.")
                exit()

            tl = TaskList(TODO_FILE_PATH)
            id = argv[2]
            tl.delete(id)
            tl.list()
        case 'upd':
            if len(sys.argv) < 6:
                print(f"too few {cmd} args.")
                exit()
            tl = TaskList(TODO_FILE_PATH)
            id = argv[2]
            title = argv[3]
            priority = int(argv[4])
            status = int(argv[5])
            tl.update(id, Task(None, title, priority, status))
            tl.list()
    # print(cmd)
