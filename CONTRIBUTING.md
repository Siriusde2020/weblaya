> Welcome to the Halo development community! Below is a guide for contributing code.

### Code Contribution Steps

#### 0. Submit an Issue

All new features or improvements should first be discussed in an issue before development begins. Bug fixes can be submitted directly as pull requests.

#### 1. Fork This Repository

Click the `Fork` button in the top-right corner of this page.

#### 2. Clone the Repository Locally

```bash
git clone https://github.com/{YOUR_USERNAME}/halo

git submodule init

git submodule update
```

#### 3. Create a New Development Branch

```bash
git checkout -b {BRANCH_NAME}
```

#### 4. Push Your Code

```bash
git push origin {BRANCH_NAME}
```

#### 5. Submit a Pull Request

Go back to your repository page, click the `New pull request` button, and create a pull request to the `main` branch of the original repository.

Then wait for our review. If there is a `Change Request`, make the changes locally and push again.

#### 6. Sync the Main Repository to Your Fork

```bash
git remote add upstream git@github.com:halo-dev/halo.git

git pull upstream main

git push
```

### E2E

Please consider adding some [e2e test cases](e2e/README.md) to make sure the APIs work as expected.

### Development Standards

Please refer to [https://docs.halo.run/developer-guide/core/code-style](https://docs.halo.run/developer-guide/core/code-style) and ensure all code is formatted before submitting.

### Usage of Cherry Pick Script

We can use the cherry pick script to cherry-pick commits in pull request as follows:

```bash
GITHUB_USER={your_github_user} hack/cherry_pick_pull.sh upstream/{target_branch} {pull_request_number}
```

> This script is from <https://github.com/kubernetes/kubernetes/blob/master/hack/cherry_pick_pull.sh>.
