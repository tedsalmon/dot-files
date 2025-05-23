return {
    "mhartington/formatter.nvim",
    opts = {
        filetype = {
            --javascript = prettier,
            --css = prettier,
            --scss = prettier,
            --json = prettier,
            --html = prettier,
            php = {
                function()
                    return {
                        exe = "/usr/bin/docker exec -i phpcs phpcbf",
                        args = {
                            "-",
                        },
                        stdin = true,
                    }
                end
            },
        },
    }
}

