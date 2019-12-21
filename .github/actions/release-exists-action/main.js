const core = require('@actions/core');
const github = require('@actions/github');

try {
    const token = core.getInput('repo-token');
    const octokit = new github.GitHub(token);

    const tag = core.getInput('tag');
    const repo = github.context.repo;

    try {
      await octokit.repos.getReleaseByTag({
        owner: repo.owner,
        repo: repo.repo,
        tag
      });
      core.setOutput("exists", true);
    } catch(err) {
      core.setOutput("exists", false)
    }
  } catch (error) {
    core.setFailed(error.message);
  }