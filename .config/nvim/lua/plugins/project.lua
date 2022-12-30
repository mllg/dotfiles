local M = {
    'ahmedkhalf/project.nvim',

    config = function()
        require('project_nvim').setup {
            patterns = { '.projectroot', '.git', '.svn', 'Makefile', 'package.json', 'DESCRIPTION' },
            detection_methods = { 'pattern' },
        }
    end
}

return M
