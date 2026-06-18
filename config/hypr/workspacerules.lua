require("programs")

for i = 1, 10 do
    hl.workspace_rule({ workspace = i, default = (i == 1) })
end
