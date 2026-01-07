from django.http import HttpResponse
from django.template import loader

# Create your views here.
def test(request):
    template = loader.get_template('page.html')
    return HttpResponse(template.render())