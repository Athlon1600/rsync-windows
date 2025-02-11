# rsync on Windows

Simple Docker image with rsync and Node.js pre-installed. Useful when wanting to use rsync on Windows.

## Usage

- Install Docker on your Windows machine first.

Command below will mount the current directory as the "source" directory that will be synced using `rsync` to
the destination folder on example.com:

```shell
docker run -it --rm -v ${PWD}:/data athlon1600/rsync bash -c 'rsync -avz -e "ssh -p 22" ./ root@example.com:/root/example'
```

You could also just define your `rsync` command inside `package.json` of your project, and then run `npm run sync`
from inside the container:

```json
{
  "scripts": {
    "sync": "rsync -avz -e \"ssh -p 22\" ./ root@example.com:/root/example",
    "sync-windows": "docker run -it --rm -v %cd%:/data athlon1600/rsync bash -c \"npm run sync\"",
    "sync2": "rsync --chmod=644 --chmod=D755 -avz -e \"ssh -o StrictHostKeyChecking=no -p 22\" --exclude 'node_modules' --exclude 'dist' ./ root@example.com:/root/example"
  }
}
```

Now you can run either `npm run sync` or `npm run sync-windows` depending on what operating system you are using.

**Note:** commands above assume you are using Windows Powershell. For regular command prompt, replace `${PWD}`
with `%cd%`.
