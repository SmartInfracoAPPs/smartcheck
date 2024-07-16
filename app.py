from flask import Flask, render_template, request, jsonify
import whois

app = Flask(__name__)

# Route for the WHOIS lookup page
@app.route('/')
def index():
    return render_template('index.html')

# Route to handle WHOIS lookup
@app.route('/whois', methods=['POST'])
def whois_lookup():
    domain = request.form['domain']
    try:
        # Perform WHOIS lookup using the whois library
        domain_info = whois.whois(domain)
        return jsonify(domain_info)
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5050)
