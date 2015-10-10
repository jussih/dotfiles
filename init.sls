{% for name, user in pillar.get('users', {}).iteritems() %}
{% if user.state == 'present' %}

vimfiles_{{ name }}:
  file.recurse:
    - source: salt://dotfiles/vim
    - name: {{ user.home }}/.vim
    - user: {{ name }}
    - user: {{ name }}
    - makedirs: True
    - requires:
       - user: {{ name }}
       - pkg: vim

bash_{{ name }}:
  file.recurse:
    - source: salt://dotfiles/bash
    - name: {{ user.home }}
    - user: {{ name }}
    - user: {{ name }}
    - makedirs: True
    
bin_{{ name }}:
  file.recurse:
    - source: salt://dotfiles/bin
    - name: {{ user.home }}/bin
    - user: {{ name }}
    - user: {{ name }}
    - makedirs: True
    - file_mode: 0744
    
git_{{ name }}:
  file.managed:
    - source: salt://dotfiles/git/.gitconfig
    - name: {{ user.home }}/.gitconfig
    - user: {{ name }}
    - user: {{ name }}
    - makedirs: True
    - template: jinja
    - defaults:
        email: {{ user.email }}
        name: {{ user.fullname }}

mercurial_{{ name }}:
  file.managed:
    - source: salt://dotfiles/hg/.hgrc
    - name: {{ user.home }}/.hgrc
    - user: {{ name }}
    - user: {{ name }}
    - makedirs: True
    - template: jinja
    - defaults:
        email: {{ user.email }}
        name: {{ user.fullname }}


{% endif %}
{% endfor %}
